<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="./CSS/main.css">
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

<title>Mon compte</title>
</head>

<body>

	<%@ include file="./fragments/header.html" %>
	
	<main>
		<div class="subtitle is-medium">
	 		Affichage de mon compte
	 	</div>
		 
		   <div class="field is-horizontal">
  			 <div class="field-label is-normal">
			    <label class="label">Pseudo:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.pseudo}
		 		</div>
		 	</div>
		 </div>
		
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Nom:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.nom}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Prénom:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.prenom}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Email:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.email}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Téléphone:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.telephone}
		 		</div>
		 	</div>
		 </div>
		 
		 <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Rue:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.rue}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Code postal:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.codePostal}
		 		</div>
		 	</div>
		 </div>
		 
		 <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Ville:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${utilisateur.ville}
		 		</div>
		 	</div>
		 </div>
		 
		 

	
		  
		 
		<div class="field-body">
		    <div class="field">
		      <div class="control">
				 <a href="/TrocEnchere.org/accueil"><button type="submit" class="button is-primary is-light" name="bouton" value="retour">Retour</button></a>
			  </div>
			</div>
		</div>
		
		
	</main>

<%@ include file="./fragments/script.html" %>
</body>
</html>