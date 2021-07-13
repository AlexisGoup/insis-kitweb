import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {

  user : any

  constructor(private router : Router) { }

  ngOnInit(): void {
    this.user = localStorage.getItem('user')
  }

  deconnecter() {
    localStorage.clear()
    window.location.reload()
  }

}
