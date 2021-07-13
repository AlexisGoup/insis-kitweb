import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Plateforme } from '../model/plateforme';

@Injectable({
  providedIn: 'root'
})
export class PlateformesService {

  url : String = 'data/'

  constructor(private http : HttpClient) { }

  getAll() : Observable<Plateforme[]> {
    return this.http.get<Plateforme[]>(this.url + '/plateformes.json')
  }

  async getByReseau(reseau : any) : Promise<Plateforme[]> {
    let find : Plateforme[] = []
    let plateformes : Plateforme[] = await this.getAll().toPromise()

    plateformes.forEach(element => {
      if (element.reseau === reseau.id) find.push(element)
    });
    
    return find
  }

  async getById(id : number) {
    let find 
    let list = await this.getAll().toPromise()
    
    list.forEach(element => {
      if (element.id === id) find = element
    });
    
    return find
  }
}
