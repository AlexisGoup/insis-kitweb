import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ReseauService {

  url : String = 'data/'

  constructor(private http : HttpClient) { }

  getAll() {
    return this.http.get<any[]>(this.url + 'reseaux.json')
  }

  async getById(id : number) {
    let find 
    let list = await this.http.get<any[]>(this.url + 'reseaux.json').toPromise()
    
    list.forEach(element => {
      if (element.id === id) find = element
    });
    
    return find
  }
}
