Index

Perfs testées via Postman,
Avec le code initial, un appel sur /communications prend 13,5 secondes
Avec le code final, il en prend 1,4 soit perf x10
Si on passe l’id du practitionner en param (use case supposé probable - e.g. on veut afficher sur une app mobile les communications du practitionner connecté), on passe à 64 ms soit perfs x200

Modifications proposées :
Refacto de la requête : au lieu d’aller chercher toutes les communications puis d’itérer sur chacune d’entre elles pour récupérer les infos du practitionner, on précharge les communications et les practitionners via includes. On permet également de passer un practitionner_id en paramètre.
Créer une vue dédiée pour api/index (best practice de ce que j’ai compris ?)

---

Create

J’ai supposé qu’on avait forcément l’id du practitionner à disposition (e.g. via current_user) ; je ne vois pas dans quel use case on voudrait créer un communication simplement à partir d’un nom et prénom (risque de doublons, homonymes).

A améliorer : je ne sais honnêtement pas trop ce qu’il faudrait “render" une fois l’appel API validé
