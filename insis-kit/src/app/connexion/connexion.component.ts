import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { User } from '../model/user';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-connexion', 
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.css']
})
export class ConnexionComponent implements OnInit {

  user : any

  constructor(private toastr: ToastrService, private userService: UserService, private router : Router) { }

  ngOnInit(): void {
    if (localStorage.getItem('user') != null) this.router.navigate(['reseaux'])
  }

  success() {
    console.log('into success');
    
    this.toastr.success('Success', 'Vous etes maintenant connecte ' + this.user.email)
    setTimeout(() => {
      localStorage.setItem('user', this.user.prenom) 
      localStorage.setItem('email', this.user.email)
      localStorage.setItem('typeUser', this.user.type)
      window.location.replace("http://plinsis.ies.univ-montp2.fr/reseaux")
    }, 1500);

  }

  fail() {
    this.toastr.error('Error', 'Mauvais username ou password')
  }

  connect(form : NgForm) {
    this.checkUser(form)
  }

  async checkUser(form: NgForm) {
    this.user = await this.userService.getByEmail(form.value.email)
    console.log(this.user);
    
    if (form.value.password === this.user.password) return this.success()
    else return this.fail()
  }

  toHome() {
    this.router.navigate(["reseaux"]);
  }

}
