import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { EquipementService } from '../services/equipement.service';
import { PlateformesService } from '../services/plateformes.service';
import { ReseauService } from '../services/reseau.service';

@Component({
  selector: 'app-new-equipement',
  templateUrl: './new-equipement.component.html',
  styleUrls: ['./new-equipement.component.css']
})
export class NewEquipementComponent implements OnInit {

  reseau : any
  plateforme : any
  equipement : any

  constructor(private route : ActivatedRoute, private plateformeService: PlateformesService, private equipementService : EquipementService, private reseauService : ReseauService, private router : Router) { }

  ngOnInit(): void {
    this.loadData();
  }

  async loadData() {
    let id_reseau = Number(this.route.snapshot.paramMap.get('id_reseau'))
    let id_plateforme = Number(this.route.snapshot.paramMap.get('id_plateforme'))
    
    this.plateforme = await this.plateformeService.getById(id_plateforme)
    this.reseau = await this.reseauService.getById(id_reseau)

    console.log(this.plateforme);
    console.log(this.reseau);
    
    
  }

}
