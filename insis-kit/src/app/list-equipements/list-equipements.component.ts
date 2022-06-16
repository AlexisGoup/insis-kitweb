import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Plateforme } from '../model/plateforme';
import { EquipementService } from '../services/equipement.service';
import { PlateformesService } from '../services/plateformes.service';
import { ReseauService } from '../services/reseau.service';

@Component({
  selector: 'app-list-equipements',
  templateUrl: './list-equipements.component.html',
  styleUrls: ['./list-equipements.component.css']
})
export class ListEquipementsComponent implements OnInit {

  id_reseau : any
  id_plateforme : any
  reseau : any
  plateforme : any
  equipements : any

  constructor(private route : ActivatedRoute, private plateformeService: PlateformesService, private equipementService : EquipementService, private reseauService : ReseauService, private router : Router) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    let id_reseau = Number(this.route.snapshot.paramMap.get('id_reseau'))
    let id_plateforme = Number(this.route.snapshot.paramMap.get('id_plateforme'))
    
    this.plateforme = await this.plateformeService.getById(id_plateforme)
    this.reseau = await this.reseauService.getById(id_reseau)
    this.equipements = await this.equipementService.getByPlatform(this.plateforme.id_plateforme)

    console.log(this.equipements);
    
  }

  navigateToNewEqt() {
    let id_reseau = Number(this.route.snapshot.paramMap.get('id_reseau'))
    let id_plateforme = Number(this.route.snapshot.paramMap.get('id_plateforme'))

    this.router.navigate([`new-equipement/${id_reseau}/${id_plateforme}`]);
  }

}
