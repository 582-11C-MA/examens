;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname automate) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; ------------------------------------------------------------------------------
;; Classes de données

;; Une Heure est un Nombre entre 0 et 23.
;; interprétation : heure de la journée

;; Un Montant est un Nombre.
;; interprétation : dollars

;; Une Salutation est une des Chaînes suivantes :
;; - "Bon matin" interprétation : salutation entre 5:00 et 12:00
;; - "Bonjour" interprétation : salutation entre 12:00 et 17:00
;; - "Bonsoir" interprétation : salutation entre 17:00 et 24:00
;; - "La nuit, je dors" interprétation : salutation entre 24:00 et 5:00

;; Une Réponse est une des Chaînes suivantes :
;; - "Pardon, je ne suis pas capable de répondre aux questions"
;; - Salutation
;; - "Vous devez <Prix>$"
;; - "Pardon, je ne comprends pas ce que vous dites"
;; interprétation : réponse de l'automate

;; ------------------------------------------------------------------------------
;; Constantes

(define PRIX-UNITAIRE 2.5)
(define TPS-TAUX (/ 5 100))
(define TVQ-TAUX (/ 9.975 100))

;; ------------------------------------------------------------------------------
;; Fonctions auxiliaires

;; Chaîne -> Chaîne
;; Retourne le dernier caractère de la chaîne donnée.
(define (dernier-car chaîne)
  (string-ith chaîne (- (string-length chaîne) 1)))

(check-expect (dernier-car "mot") "t")

;; Chaîne -> Booléen
;; Détermine si le propos donné est une question.
(define (question? propos)
  (string=? (dernier-car propos) "?"))

(check-expect (question? "Suis-je une question?") #true)
(check-expect (question? "Suis-je une question") #false)

;; Heure -> Booléen
;; Détermine si c'est le matin.
(define (matin? heure)
  (and (>= heure 5) (< heure 12)))

(check-expect (matin? 4) #false)
(check-expect (matin? 5) #true)
(check-expect (matin? 6) #true)
(check-expect (matin? 12) #false)
(check-expect (matin? 13) #false)

;; Heure -> Booléen
;; Détermine si c'est l'après-midi.
(define (après-midi? heure)
  (and (>= heure 12) (< heure 17)))

(check-expect (après-midi? 11) #false)
(check-expect (après-midi? 12) #true)
(check-expect (après-midi? 13) #true)
(check-expect (après-midi? 17) #false)
(check-expect (après-midi? 18) #false)

;; Heure -> Booléen
;; Détermine si c'est le soir.
(define (soir? heure)
  (and (>= heure 17) (< heure 24)))

(check-expect (soir? 16) #false)
(check-expect (soir? 17) #true)
(check-expect (soir? 18) #true)
(check-expect (soir? 24) #false)

;; Heure -> Booléen
;; Détermine si c'est la nuit.
(define (nuit? heure)
  (and (>= heure 0) (< heure 5)))

(check-expect (nuit? 0) #true)
(check-expect (nuit? 1) #true)
(check-expect (nuit? 5) #false)
(check-expect (nuit? 6) #false)

;; Heure -> Salutation
;; Détermine la Salutation appropriée pour l'heure donnée.
(define (salutation heure)
  (cond ((matin? heure) "Bon matin")
        ((après-midi? heure) "Bonjour")
        ((soir? heure) "Bonsoir")
        ((nuit? heure) "La nuit, je dors")))

;; Montant -> Montant
;; Calcule la TPS pour le montant donné.
(define (TPS montant)
  (* montant TPS-TAUX))

;; Montant -> Montant
;; Calcule la TVQ pour le montant donné.
(define (TVQ montant)
  (round (* montant TVQ-TAUX)))

;; Montant -> Montant
;; Calcule les taxes pour le montant donné.
(define (taxes montant)
  (+ (TPS montant)
     (TVQ montant)))

;; Nombre -> Montant
;; Calcule le sous-total pour le nombre de boissons donné.
(define (sous-total boissons)
  (* boissons PRIX-UNITAIRE))

;; Nombre -> Montant
;; Calcule le total pour le sous-total donné.
(define (total sous-total)
  (+ sous-total (taxes sous-total)))

;; Montant -> Réponse
;; Produit la facture selon le total donné.
(define (facture total)
  (string-append "Vous devez " (number->string-digits total 2) "$"))

(check-expect (facture 1.3413) "Vous devez 1.34$")

;; ------------------------------------------------------------------------------
;; Fonction principale
     
;; Heure Chaîne NombreBoissons -> Réponse
;; Détermine la réponse de l'automate selon l'heure,
;; le propos de l'interlocuteur, et le nombre de boissons donnés.
(define (répond heure propos boissons)
  (cond ((question? propos) "Pardon, je ne suis pas capable de répondre aux questions")
        ((string=? propos "Allô") (salutation heure))
        ((string=? propos "La facture, SVP") (facture (total (sous-total boissons))))
        (else "Pardon, je ne comprends pas ce que vous dites")))

