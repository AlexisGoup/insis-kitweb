import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-connexion',
  templateUrl: './connexion.component.html',
  styleUrls: ['./connexion.component.css']
})
export class ConnexionComponent implements OnInit {

  email : string = 'email'
  password : string = 'password'

  constructor(private toastr: ToastrService) { }

  ngOnInit(): void {
  }

  success() {
    this.toastr.success('Succes', 'Vous etes maintenant connecte ' + this.email)
  }

  fail() {
    this.toastr.error('Error', 'Wrong username or password')
  }

  checkId(form : NgForm) {
    (form.value.email === this.email && form.value.password === this.password) ? this.success() : this.fail()
  }

}
