# git-host
A gitbucket instance for the Resel users

## Déploiement
```bash
git clone https://github.com/ResEl-TB/git-host.git
docker build -t resel-tb/git-host .
docker run -d -v /data/gitbucket/dir:/data -p 22:22 -p 8080:8080 --name git-host resel-tb/git-host
```

Il faut configurer gitbucket après le premier lancement (activer le ssh sur le port 22 + activer auth LDAP)
Note : l'utilisateur par défaut est root:root après un fresh install

## Redémarrage 
 Après un arret de la machine physique ou un docker stop
```bash
docker start git-host
```
## Mise à jour
1. Effectuer les modifications dans le dossier git-host/.
2. Re-construire, et tester le conteneur:  
`docker build -t resel-tb/git-host . && docker run --rm -t -v /bckp/dir:/home/git resel-tb/git-host`.
3. Si fonctionnel, commiter et pusher les modifications: `git commit -am 'DESCRIPTION' && git push`.

## Test Run
```bash
docker run --rm -v /data/gitbucket/dir:/data -p 22:22 -p 8080:8080 --name git-host resel-tb/git-host
```

