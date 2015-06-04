# git-host
A gitbucket instance for the Resel users

## Déploiement
```bash
git clone https://github.com/ResEl-TB/git-host.git
docker build -t resel-tb/git-host .
docker run -d -v /bckp/dir:/home/git -e "GITBUCKET_HOST=git.resel.fr" --name git-host resel-tb/git-host
```
## Redémarrage 
 Après un arret de la machine physique ou un docker stop
```bash
docker start git-host
```
## Mise à jour
1. Effectuer les modifications dans le dossier web-proxy/.
2. Re-construire, et tester le conteneur:  
`docker build -t resel-tb/git-host . && docker run -t -v /bckp/dir:/home/git resel-tb/git-host`.
3. Si fonctionnel, commiter et pusher les modifications: `git commit -am 'DESCRIPTION' && git push`.

