# Pipeline CI-CD :

Pull request uniquement :
- Pour commit sur une branche il faut obligatoirement passer par une pull request.
- Pour qu'une pull request soit acceptée au moins une personne doit aprouver son implémentation.

Intégration continue (toutes les branches) :
- Lorsqu'une pull-request est initiée sur une branche autre que la branche main on lance automatiquement le processus de CI.
- Un lint du code est effectué sur les changements apportés cela inclut le Dockerfile.
- L'image docker est build et lancée.
- Un test est effectuée depuis un contneur.
- Si build ou le test ne sont pas passés la pull request est refusée.

Déploiement continue (main uniquement) :
- Lorsqu'une pull-request est initiée sur la branche main on lance automatiquement le processus de déploiement.
- On repasse par le processus d'intégration continue avant de continuer.
- Si le processus d'intégration continue réussi on récupère et déploie l'image sur dockerhub.

Livraison continue :
- Lorsqu'une release est crée avec un tag.
- On repasse par le processus de Déploiement (incluant le processus d'intégration continue) avant de continuer.
- Si le processus de déploiement réussi on met à disposition la branche main dans une release.


# Commandes docker :

Build le dockerfile :
docker build -t app .

run un conteneur en read only (On spécifie le port aprés les tags -e et p soit -e "<port> -p<port>:<port>" respectivement) :
docker run --read-only --name my-container -d -e PORT=8080 -p 8080:8080 app
