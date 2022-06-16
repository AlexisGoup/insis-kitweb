import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Equipement } from '../model/equipement';
import { Plateforme } from '../model/plateforme';
import { Reseau } from '../model/reseau';
import { EquipementService } from '../services/equipement.service';
import { PlateformesService } from '../services/plateformes.service';
import { ReseauService } from '../services/reseau.service';

@Component({
  selector: 'app-list-plateformes',
  templateUrl: './list-plateformes.component.html',
  styleUrls: ['./list-plateformes.component.css']
})
export class ListPlateformesComponent implements OnInit {

  reseau : any 
  plateformes : any 
  equipements : any 

  constructor(private route : ActivatedRoute, private reseauService : ReseauService, private plateformesService : PlateformesService, private eqtService : EquipementService) { }

  ngOnInit() {
    this.loadData()
  }

  async loadData() {
    let id = Number(this.route.snapshot.paramMap.get('id'))

    this.reseau = await this.reseauService.getById(id)
    this.plateformes = await this.plateformesService.getByReseau(this.reseau)
    console.log(this.plateformes);
    
    //this.equipements = await this.eqtService.getByReseau(this.reseau)
  }

}
