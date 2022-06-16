import { Component, OnInit } from '@angular/core';
import { ReseauService } from '../services/reseau.service';

@Component({
  selector: 'app-front-home',
  templateUrl: './front-home.component.html',
  styleUrls: ['./front-home.component.css']
})
export class FrontHomeComponent implements OnInit {

  reseaux : any

  constructor(private reseauService : ReseauService) { }

  ngOnInit(): void {
    this.reseaux = this.getReseaux()
  }

  async getReseaux() {
    this.reseaux = await this.reseauService.getAll().toPromise()
    console.log(this.reseaux);
  }

  createNew() {}
}
