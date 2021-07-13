import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AdminGuard implements CanActivate {
  
  constructor (private router : Router) {}
  
  canActivate() {
    if (localStorage.getItem('typeUser') == 'admin') return true;
    alert("Vous n'avez pas les privileges pour voir cette page, redirection vers la page d'acceuil")
    setTimeout(() => {
      this.router.navigate(['reseaux'])
    }, 1500);
    return false
  }
  
}
