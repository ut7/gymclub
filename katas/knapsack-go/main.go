package main

import "log"

func main() {
	log.Printf("Hello world")
}

type Objet struct {
	Volume int
	Valeur int
}

func NewObjet(volume int, valeur int) *Objet {
	return &Objet{Volume: volume, Valeur: valeur}
}

func ListeOptimale(list []*Objet, contenance int) []*Objet {
	resultat := make([]*Objet, 0)
	for _, objet := range list {
		if objet.Volume <= contenance {
			resultat = append(resultat, objet)
			contenance -= objet.Volume
		}
	}
	return resultat
}
