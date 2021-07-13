import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Equipement } from '../model/equipement';
import { Plateforme } from '../model/plateforme';
import { Reseau } from '../model/reseau';

@Injectable({
  providedIn: 'root'
})
export class EquipementService {

  url : String = 'data/'

  constructor(private http : HttpClient) { }

  getAll() : Observable<Equipement[]> {
    console.log(this.http.get<Equipement[]>(this.url + '/equipements.json'));
     return this.http.get<Equipement[]>(this.url + '/equipements.json')
  }

  async getByPlatform(plateforme : Plateforme) {
    let find : Equipement[] = []
    let plateformes : Equipement[] = await this.getAll().toPromise()

    plateformes.forEach(element => {
      if (element.plateforme === plateforme.id) find.push(element)
    });
    
    return find
  }

  async getByReseau(reseau : Reseau) {
    let find : Equipement[] = []
    let plateformes : Equipement[] = await this.getAll().toPromise()

    plateformes.forEach(element => {
      if (element.reseau === reseau.id) find.push(element)
    });
    
    return find
  }
}
