import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { UserService } from '../services/user.service';

@Component({
  selector: 'app-compte',
  templateUrl: './compte.component.html',
  styleUrls: ['./compte.component.css']
})
export class CompteComponent implements OnInit {

  user : any

  constructor(private userService : UserService, private router : Router, private toastr: ToastrService) { }

  ngOnInit(): void {
    this.getUser()
  }

  async getUser() {
    let email = localStorage.getItem('email')
    this.user = await this.userService.getByEmail(email)
  }

  saved() {
    this.toastr.success('Informations enregistrees avec succes')
  }
}
