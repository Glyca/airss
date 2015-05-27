# AiRSS

Projet IPW 204/2015 : Aggregateur de flux RSS

Version en Ligne du site web avec Heroku [ici](http://airss.herokuapp.com/).

## Prérequis

 * Ruby (>= 2.2) [Documentation Ubuntu](http://doc.ubuntu-fr.org/rubyonrails).
 * PostgreSQL [Documentation Ubuntu](http://doc.ubuntu-fr.org/postgresql).

## Installation

*L'installation a été testée sur des versions d'Ubuntu >= 14.10
avec PostgreSQL installé et configuré*

* Créez un répertoire airss à l'endroit ou vous souhaitez installer l'aggregateur

* Déplacez vous dans ce dossier à l'aide de la commande ``` cd ``` puis lancez la commande suivante :

```sh
git clone https://github.com/Glyca/airss.git
```

* une fois que le clone a été fait, afin d'importer toute les gem nécessaires au bon fonctionnement de l'application, lancez la commande :
```sh
bundle install
```

* Configurez maintenant la base de données grâce à la commande suivante :

```sh
bundle exec rake db:setup
```

* Pour configurer l'envoye de mail avec [mailgun](http://www.mailgun.com/) créez un fichier **.env** à la racine de votre application contenant les champs suivants :
```sh
MAILGUN_DOMAIN=
MAILGUN_USERNAME=
MAILGUN_PASSWORD=
```

* Il vous reste plus qu'à lancer le serveur :
```sh
bundle exec rails server
```

* Pour accéder à l'aggregateur, lancez un navigateur web et tapez :

```sh
localhost:3000
```
