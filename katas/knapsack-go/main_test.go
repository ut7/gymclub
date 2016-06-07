package main

import "testing"

func TestListeOptimaleVide(t *testing.T) {
	list := ListeOptimale(make([]*Objet, 0), 20)
	if len(list) != 0 {
		t.Errorf("La liste optimale devrait être vide, mais j'ai eu %+v", list)
	}
}

func TestAucunObjetSuffisamentPetitPourLeSac(t *testing.T) {
	objets := make([]*Objet, 0)
	objets = append(objets, NewObjet(30, 50))
	list := ListeOptimale(objets, 20)

	if len(list) != 0 {
		t.Errorf("La liste optimale devrait être vide, mais j'ai eu %+v", list)
	}
}

func TestListeObjetSuffisamentPetitPourLeSac(t *testing.T) {
	objets := make([]*Objet, 0)
	objets = append(objets, NewObjet(20, 50))
	list := ListeOptimale(objets, 20)

	if len(list) != 1 {
		t.Errorf("La liste optimale devrait être rempli, mais j'ai eu %+v", list)
	}
}

func TestListePlusieursObjetsSuffisamentPetitPourLeSac(t *testing.T) {
	objets := make([]*Objet, 0)
	objets = append(objets, NewObjet(20, 50))
	objets = append(objets, NewObjet(20, 50))
	list := ListeOptimale(objets, 20)

	if len(list) != 1 {
		t.Errorf("La liste optimale devrait être rempli, mais j'ai eu %+v", list)
	}
}

func TestChoixObjetAvecLePlusDeValeur(t *testing.T) {
	objets := make([]*Objet, 0)
	objets = append(objets, NewObjet(20, 50))
	objets = append(objets, NewObjet(20, 80))
	list := ListeOptimale(objets, 20)

	if len(list) != 1 {
		t.Errorf("La liste optimale devrait être rempli, mais j'ai eu %+v", list)
	}
	if list[0] != objets[1] {
		t.Errorf("Je voulais le deuxieme objet, mais j'ai eu %+v", list[0])
	}
}
