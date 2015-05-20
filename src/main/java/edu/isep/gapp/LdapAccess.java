package edu.isep.gapp;

import java.io.Serializable;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.directory.Attribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

import edu.isep.beans.LdapObject;
/**
 * accès à l'annuaire LDAP de l'ISEP
 * pour :
 * authentification des utilisateurs
 * retrouver le mail ISEP d'un utilisateur
 * @author gilles Carpentier
 * @version 09/02/2015 ajout de la fermeture du contexte pour libérer les ressources plus rapidement
 */
public class LdapAccess implements Serializable
{
	private static final long serialVersionUID = 1L;


/**
 * authentification
 * @param user
 * @param mot de passe
 * @return l'objet LDAP ou null si pas trouvé
 * @throws Exception
 */

	public static LdapObject LDAPget(String user, String mdp) throws Exception
	{

		System.out.println("test Ldap running - 1");
		// System.out.println(user + " " + mdp);
		// Initial context implementation
		String INITCTX = "com.sun.jndi.ldap.LdapCtxFactory";
		String MY_HOST = "ldap://ldap.isep.fr:389";
		String MGR_DN = "uid=" + user + ", " + "ou=People, dc=isep.fr";
		String MGR_PW = mdp;
		String MY_SEARCHBASE = "dc=isep.fr";
		String MY_FILTER = "(uid=" + user + ")";

		String login = null;
		String nom = null; // nom complet (nom + prénom)
		String nomFamille = null;
		String prenom = null;
		String type = null;
		String employeeNumber = null;
		String mail = null;
		String messageErreur = "LOGIN INVALIDE";
		try
		{

			System.out.println("test Ldap running - 2");
			// Hashtable for environmental information
			Hashtable<String, String> env = new Hashtable<String, String>();

			// Specify which class to use for our JNDI provider
			env.put(Context.INITIAL_CONTEXT_FACTORY, INITCTX);

			// Specify host and port to use for directory service
			env.put(Context.PROVIDER_URL, MY_HOST);
			env.put(Context.SECURITY_AUTHENTICATION, "simple");
			env.put(Context.SECURITY_PRINCIPAL, MGR_DN);
			env.put(Context.SECURITY_CREDENTIALS, MGR_PW);
			

			System.out.println("test Ldap running - 3");

			// Get a reference to a directory context
			DirContext ctx = new InitialDirContext(env);

			System.out.println("test Ldap running - 3.5");
			// Specify the scope of the search
			SearchControls constraints = new SearchControls();
			constraints.setSearchScope(SearchControls.SUBTREE_SCOPE);
			

			System.out.println("test Ldap running - 3.6");

			// Perform the actual search
			// We give it a searchbase, a filter and a the constraints
			// containing the scope of the search
			NamingEnumeration<SearchResult> results = ctx.search(MY_SEARCHBASE,
					MY_FILTER, constraints);
			

			System.out.println("test Ldap running - 4");

			// Now step through the search results
			while (results != null && results.hasMore())
			{
				System.out.println("test Ldap running in loop");
				SearchResult sr = (SearchResult) results.next();

				String dn = sr.getName();

				Attribute cn = sr.getAttributes().get("cn");
				nom = (String) cn.get();
				Attribute uid = sr.getAttributes().get("uid");
				login = (String) uid.get();
				Attribute et = sr.getAttributes().get("employeeType");
				type = (String) et.get();				
				Attribute sn = sr.getAttributes().get("sn");
				nomFamille = (String) sn.get();				
				Attribute givenName = sr.getAttributes().get("givenname");
				prenom = (String) givenName.get();

				try {
					Attribute en = sr.getAttributes().get("employeeNumber");
					employeeNumber = (String) en.get();
				} catch (Exception e) {
					messageErreur = "numéro d'élève non trouvé dans l'annuaire";
				}
				Attribute em = sr.getAttributes().get("mail");			
				mail = (String) em.get();
				
				ctx.close();
			}
		} catch (Exception e)
		{
			System.err.println(e);
			throw (new Exception(messageErreur));
		}

		LdapObject reponse = new LdapObject(login, mdp, nom, nomFamille, prenom, type, employeeNumber, mail);
		return reponse;
	}
}
