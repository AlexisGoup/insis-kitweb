import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-front-header',
  templateUrl: './front-header.component.html',
  styleUrls: ['./front-header.component.css']
})
export class FrontHeaderComponent implements OnInit {

  user : any

  constructor(private router : Router) { }

  ngOnInit(): void {
    this.user = localStorage.getItem('user')
  }

  toHome() {
    this.router.navigate(["reseaux"]);
  }

  deconnecter() {
    localStorage.clear()
    window.location.reload()
  }

}
