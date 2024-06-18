# Examen 1

> Pondération : 10% \
> Remise : 25 juin \
> Modalité : individuel

Ye est fascinée par les automates, des poupées mécaniques qui
reproduisent en autonomie une séquence d'actions prédéterminées sans
intervention humaine. Inspirée par une récente visite au musée national
de la nature et des sciences de Tokyo, elle décide d'entreprendre la
création d'un automate capable de servir le thé. Ye se charge du
mécanisme pour faire bouger la poupée, mais elle demande votre aide pour
que la poupée soit capable de tenir un dialogue simple. 

L'automate doit répondre une des phrases suivantes selon l'heure de la
journée, ce que dit l'interlocuteur, et le nombre de boissons commandées. 

-   Si on lui pose une question, l'automate doit répondre « Pardon, je
    ne suis pas capable de répondre aux questions ». Toute chaîne de
    caractères se terminant par un point d'interrogation peut être
    considérée comme une question. 

-   Si on lui dit « Allô », l'automate doit répondre avec la salutation
    appropriée : le matin, la salutation appropriée est « Bon matin » ;
    l'après-midi, la salutation appropriée est « Bonjour » ; le soir, la
    salutation appropriée est « Bonsoir ». Si on parle à l'automate
    durant la nuit, il répondra « La nuit, je dors ».

-   Enfin, si on lui dit « La facture, SVP », l'automate doit répondre
    « Vous devez \<total\>$ ». Le total de la facture est calculé à
    partir du nombre de boissons commandées. Chaque boisson coûte 2.50$.
    Le total doit inclure les taxes fédérales et provinciales.

-   Dans tous les autres cas, l'automate doit répondre « Pardon, je ne
    comprends pas ce que vous dites ».

Votre tâche est de créer une fonction principale qui a comme valeur de
sortie la réponse de l'automate.

## Remise

Le programme doit être remis dans un fichier nommé « automate.rkt »,
dans un dépôt crée à cet effet. Pour créer le dépôt, cliquez [ici][].

[ici]: https://classroom.github.com/a/QgizFQLZ

## Critères d'évaluation

-   La logique est bonne.
-   Les valeurs d'entrée du programme (c'est-à-dire les paramètres de la
    fonction principale) sont correctement identifiées.
-   Chaque tâche du programme est accomplie par une fonction auxiliaire.
-   Le nom donnée aux variables correspond à leur valeur, celui donné
    aux fonctions représente l'opération qu'elles effectuent.
-   Le code est correctement formaté : les lignes ne dépassent pas 80
    caractères, l'espacement entre les caractères respecte la
    convention, et les opérandes des expressions complexes sont alignés
    verticalement.
-   La signification des prédicats est rendue explicite à l'aide de
    fonctions auxiliaires dont le nom respecte la convention.
-   Les informations dont la valeur ne change pas sont représentées par
    des constantes.
-   Le code ne se répète pas inutilement.
