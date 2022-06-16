import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Reseau } from '../model/reseau';

@Injectable({
  providedIn: 'root'
})
export class ReseauService {

  url : string = 'http://localhost:3000'

  constructor(private http : HttpClient) { }

  getAll() {
    return this.http.get<Reseau[]>(this.url + '/reseaux')
  }

  async getById(id : any) {
    let find 
    let list = await this.http.get<Reseau[]>(this.url + '/reseaux/' + id).toPromise()
    
    list.forEach(element => {
      if (element.id_reseau === id) find = element
    });
    
    return find
  }
}
