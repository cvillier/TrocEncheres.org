<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="./main.css">
	<script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>

<title>Troc-Ench�res D�tail Vente</title>
</head>
<body>
	<header>
		<div>Troc-Ench�res</div>
	</header>
	<main>
		<div class="subtitle is-medium">
	 		D�tail Vente
	 	</div>
	 	
	 	<div>
			  <c:if test="${listeCodesErreur!=null && listeCodesErreur.size()>0 }">
			  	<c:forEach var="err" items="${listeCodesErreur}">
			 		<li>${err}</li>
			 	</c:forEach>
			  </c:if>
	  	</div>
		
		   <div class="field is-horizontal">
  			 <div class="field-label is-normal">
			    <label class="label">Article:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    	${vente.nomArticle}
		 		</div>
		 	</div>
		 </div>
		
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Description:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
    				<p>${vente.description}</p>
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Meilleure offre:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
    				${enchere.points} pts par ${encherit.pseudo}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Mise � prix:</label>
			 </div>
			 <div class="field-body">
    			${vente.miseAPrix}
		 	</div>
		 </div>
		  
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Fin de l'ench�re:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    		${vente.dateFinEncheres}
		 		</div>
		 	</div>
		 </div>
		 
		   <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Retrait:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    		${retrait.rue}<br>
			    		${retrait.codePostal}${retrait.ville}
		 		</div>
		 	</div>
		 </div>
		 
		  <div class="field is-horizontal">
  			<div class="field-label is-normal">
			    <label class="label">Vendeur:</label>
			 </div>
			 <div class="field-body">
    			<div class="field">
			    		${vendeur.pseudo}
		 		</div>
		 	</div>
		 </div>
		 
		<div class="field-body">
		    <div class="field">
		      <div class="control">
		      <button type="submit" class="button is-primary" name="bouton" value="${utilisateur.noVente}" formaction="/TrocEnchere.org/DetailVente" formmethod="post">Annuler la vente</button>
		      <a href=""><button type="submit" class="button is-primary is-light" name="bouton" value="retour">Back</button></a> <%--rediriger vers l'accueil --%>
			  </div>
			</div>
		</div>
		
	</main>

</body>
</html>