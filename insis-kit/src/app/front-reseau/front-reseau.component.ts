import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlateformesService } from '../services/plateformes.service';
import { ReseauService } from '../services/reseau.service';

@Component({
  selector: 'app-front-reseau',
  templateUrl: './front-reseau.component.html',
  styleUrls: ['./front-reseau.component.css']
})
export class FrontReseauComponent implements OnInit {

  reseau : any
  plateformes : any

  constructor(private route : ActivatedRoute, private reseauService : ReseauService, private pfServices : PlateformesService) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    let id = Number(this.route.snapshot.paramMap.get('id'))
    this.reseau = await this.reseauService.getById(id)
    this.plateformes = await this.pfServices.getByReseau(this.reseau)
    console.log(this.plateformes);
    
  }
}
