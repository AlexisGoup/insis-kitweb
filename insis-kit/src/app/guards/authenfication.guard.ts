import { Injectable } from '@angular/core';
import {CanActivate, Router} from '@angular/router';

@Injectable({
  providedIn: 'root'
})
export class AuthenficationGuard implements CanActivate {

  constructor (private router : Router) {}
  
  canActivate() {
    if (localStorage.getItem('email')) return true;
    alert("Vous n'etes pas connecte, redirection vers la page de connexion")
    setTimeout(() => {
      this.router.navigate(['connexion'])
    }, 1500);
    return false
  }
  
}
