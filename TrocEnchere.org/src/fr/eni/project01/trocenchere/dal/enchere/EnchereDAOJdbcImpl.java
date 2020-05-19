package fr.eni.project01.trocenchere.dal.enchere;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import fr.eni.projet01.trocenchere.bll.UtilisateurManager;
import fr.eni.projet01.trocenchere.bo.Enchere;
import fr.eni.projet01.trocenchere.bo.Utilisateur;
import fr.eni.projet01.trocenchere.bo.Vente;
import fr.eni.projet01.trocenchere.dal.ConnectionProvider;
import fr.eni.projet01.trocenchere.erreurs.BusinessException;

//Amandine
//modified Janet

public class EnchereDAOJdbcImpl implements EnchereDAO {

	private static final String INSERT_ENCHERE_SQL = "INSERT INTO encheres(date_enchere, no_acheteur, no_vente, points) VALUES (?,?,?,?)";

	private static final String SELECTBYID_ENCHERE_SQL = "SELECT * FROM encheres INNER JOIN ventes ON encheres.no_vente = ventes.no_vente WHERE ventes.no_vente = ? ORDER BY points DESC";
	private static final String SELECTBY_UTILISATEURID_VENTES_SQL = "SELECT * FROM encheres INNER JOIN ventes ON encheres.no_vente = ventes.no_vente WHERE encheres.no_acheteur = ? ORDER BY points DESC";

	private static final String SELECTBY_UTILISATEURID_VENTESID_SQL = "SELECT * FROM encheres INNER JOIN ventes ON encheres.no_vente = ventes.no_vente INNER JOIN utilisateurs ON encheres.no_acheteur = utilisateurs.no_utilisateur WHERE encheres.no_acheteur = ? AND encheres.no_vente=?";

	private static final String DELETE_ENCHERES_SQL = "DELETE FROM encheres WHERE no_vente = ?";

	public Enchere selectOneByUserIdVenteId(int noUtilisateur, int noVente) throws BusinessException {

		Enchere enchere = new Enchere();
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement state = cnx.prepareStatement(SELECTBY_UTILISATEURID_VENTESID_SQL);) {
			ResultSet rs;
			state.setInt(1, noUtilisateur);
			state.setInt(2, noVente);
			rs = state.executeQuery();

			if (rs == null) {
				enchere = null;
			} else {
				rs.next();
				enchere.setDateEnchere(rs.getDate("date_enchere").toLocalDate());
				Utilisateur utilisateur = new Utilisateur();
				utilisateur.setNoUtilisateur(noUtilisateur);
				utilisateur.setPseudo(rs.getString("pseudo"));
				utilisateur.setNom(rs.getNString("nom"));
				utilisateur.setPrenom(rs.getNString("prenom"));
				utilisateur.setEmail(rs.getNString("email"));
				utilisateur.setTelephone(rs.getString("telephone"));
				utilisateur.setRue(rs.getString("rue"));
				utilisateur.setCodePostal(rs.getString("code_postal"));
				utilisateur.setVille(rs.getString("ville"));
				utilisateur.setMotDePasse(rs.getString("mot_de_passe"));
				utilisateur.setCredit(rs.getInt("credit"));
				utilisateur.setAdministrateur(rs.getBoolean("administrateur"));
				enchere.setEncherit(utilisateur);

				Vente vente = new Vente();
				vente.setNoVente(noVente);
				vente.setNomArticle(rs.getString("nomarticle"));
				vente.setDescription(rs.getString("description"));
				vente.setDateFinEncheres(rs.getDate("date_fin_encheres").toLocalDate());
				vente.setMiseAPrix(rs.getInt("prix_initial"));
				vente.setPrixVente(rs.getInt("prix_vente"));
				enchere.setConcerne(vente);

				enchere.setPoints(rs.getInt("points"));

				rs.close();
			}

		} catch (Exception e) {
			BusinessException be = new BusinessException();
			e.printStackTrace();
			be.ajouterErreur("Erreur: id inconnu");
			throw be;
		}

		return enchere;

	}

	@Override
	public List<Enchere> selectByUserId(int noUtilisateur) throws BusinessException {
		List<Enchere> listeEnchere = new ArrayList<Enchere>();
		Enchere enchere = new Enchere();
		try (Connection cnx = ConnectionProvider.getConnection();
				// Connection cnx = fr.eni.projet01.trocenchere.dal.Connection.getConnection();
				PreparedStatement state = cnx.prepareStatement(SELECTBY_UTILISATEURID_VENTES_SQL);) {
			ResultSet rs;
			state.setInt(1, noUtilisateur);
			rs = state.executeQuery();
			while (rs.next()) {
				if (rs.getInt("no_vente")!=enchere.getConcerne().getNoVente() && noUtilisateur!=enchere.getEncherit().getNoUtilisateur()) {
					
					enchere.setDateEnchere(rs.getDate("date_enchere").toLocalDate());
			
					UtilisateurManager um = new UtilisateurManager();
					Utilisateur user = um.selectionnerUtilisateurById(noUtilisateur);
					enchere.setEncherit(user);
			
					Vente vente = new Vente();
					vente.setNoVente(rs.getInt("no_vente"));
					vente.setNomArticle(rs.getString("nomarticle"));
					vente.setDescription(rs.getString("description"));
					vente.setDateFinEncheres(rs.getDate("date_fin_encheres").toLocalDate());
					vente.setMiseAPrix(rs.getInt("prix_initial"));
					vente.setPrixVente(rs.getInt("prix_vente"));
					enchere.setConcerne(vente);
			
					enchere.setPoints(rs.getInt("points"));
					
					listeEnchere.add(enchere);			
				}
				
			}
			rs.close();
		} catch (Exception e) {
			BusinessException be = new BusinessException();
			e.printStackTrace();
			be.ajouterErreur("Erreur: id inconnu");
			throw be;
		}

		return listeEnchere;

	}


	@Override
	public List<Enchere> selectByVenteId(int noVente) throws BusinessException {
		List<Enchere> listeEnchere = new ArrayList<Enchere>();
		Enchere enchere = new Enchere();
		try (Connection cnx = ConnectionProvider.getConnection();
				// Connection cnx = fr.eni.projet01.trocenchere.dal.Connection.getConnection();
				PreparedStatement state = cnx.prepareStatement(SELECTBYID_ENCHERE_SQL);) {
			ResultSet rs;
			state.setInt(1, noVente);
			rs = state.executeQuery();
			while (rs.next()) {
				if (noVente!=enchere.getConcerne().getNoVente() && rs.getInt("no_acheteur")!=enchere.getEncherit().getNoUtilisateur()) {
					enchere.setDateEnchere(rs.getDate("date_enchere").toLocalDate());
		
					UtilisateurManager um = new UtilisateurManager();
					Utilisateur user = um.selectionnerUtilisateurById(rs.getInt("no_acheteur"));
					enchere.setEncherit(user);
		
					Vente vente = new Vente();
					vente.setNoVente(noVente);
					vente.setNomArticle(rs.getString("nomarticle"));
					vente.setDescription(rs.getString("description"));
					vente.setDateFinEncheres(rs.getDate("date_fin_encheres").toLocalDate());
					vente.setMiseAPrix(rs.getInt("prix_initial"));
					vente.setPrixVente(rs.getInt("prix_vente"));
					enchere.setConcerne(vente);
		
					enchere.setPoints(rs.getInt("points"));
					
					listeEnchere.add(enchere);
				}
			}
			rs.close();
			
		} catch (Exception e) {
			BusinessException be = new BusinessException();
			e.printStackTrace();
			be.ajouterErreur("Erreur: id inconnu");
			throw be;
		}

		return listeEnchere;
	}

	@Override
	public void insert(Enchere newEnchere) throws BusinessException {
		BusinessException be = new BusinessException();
		try (Connection cnx = ConnectionProvider.getConnection()) {
			PreparedStatement state = cnx.prepareStatement(INSERT_ENCHERE_SQL, PreparedStatement.RETURN_GENERATED_KEYS);
			state.setDate(1, java.sql.Date.valueOf(newEnchere.getDateEnchere()));
			Utilisateur user = newEnchere.getEncherit();
			int idUser = user.getNoUtilisateur();
			System.out.println(idUser);
			state.setInt(2, idUser);
			Vente sale = newEnchere.getConcerne();
			int idSale = sale.getNoVente();
			System.out.println(idSale);
			state.setInt(3, idSale);
			int pts = newEnchere.getPoints();
			System.out.println(pts);
			state.setInt(4, pts);

			state.executeUpdate();

			state.close();

		} catch (Exception e4) {
			e4.printStackTrace();
			be.ajouterErreur("Erreur: impossible de créer l'enchere");
			throw be;
		}
	}

	@Override
	public void delete(int noVente) throws BusinessException {
		try (Connection cnx = ConnectionProvider.getConnection();
				PreparedStatement state = cnx.prepareStatement(DELETE_ENCHERES_SQL)) {

			state.setInt(1, noVente);
			state.executeUpdate();

		} catch (Exception e) {
			BusinessException be = new BusinessException();
			e.printStackTrace();
			be.ajouterErreur("Erreur: supression impossible car n° de vente inconnu");
			throw be;
		}

	}

}
