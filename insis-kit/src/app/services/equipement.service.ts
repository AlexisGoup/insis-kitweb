import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Plateforme } from '../model/plateforme';
import { Reseau } from '../model/reseau';
import { Equipement } from '../model/equipement';

@Injectable({
  providedIn: 'root'
})
export class EquipementService {

  url : string = 'http://localhost:3000'

  constructor(private http : HttpClient) { }

  getAll() {
    return this.http.get<Equipement[]>(this.url + '/equipements/');
  }

  async getByPlatform(id_plateforme : number) {
    let find : Equipement[] = []
    let all_equipements  = await this.getAll().toPromise()

    all_equipements.forEach(element => {
      if (element.id_plateforme === id_plateforme) find.push(element)
    });
    
    return find
  }

  getByReseau(reseau : Reseau) {
    return this.http.get<Equipement[]>(this.url + '/equipements_du_reseau/' + reseau.id_reseau);
  }

  getById(id : Number) {
    return this.http.get<Equipement>(this.url + '/equipements/' + id);
  }
}
