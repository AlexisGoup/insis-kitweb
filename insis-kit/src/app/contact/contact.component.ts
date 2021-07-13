import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.css']
})
export class ContactComponent implements OnInit {

  constructor(private toastr : ToastrService, private router : Router) { }

  ngOnInit(): void {
  }

  send() {
    this.toastr.success('succes', 'Message envoye avec succes')
    setTimeout(() => {
      this.router.navigate(['reseaux'])
    }, 1500);
  }
}
