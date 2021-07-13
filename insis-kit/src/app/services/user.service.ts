import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http'
import { User } from '../model/user';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  url : String = 'data/'

  constructor(private http: HttpClient) { }

  getAll() {
    return this.http.get<User[]>(this.url + 'users.json')
  }

  async getByEmail (email : any) {
    let find 
    let list = await this.getAll().toPromise()
    
    list.forEach(element => {
      if (element.email === email) find = element
    });
    
    return find
  }

  post(user : User) {
    return this.http.post(this.url + 'users.json', user)
  }
}
