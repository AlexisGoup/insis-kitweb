import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Plateforme } from '../model/plateforme';
import { EquipementService } from '../services/equipement.service';
import { PlateformesService } from '../services/plateformes.service';

@Component({
  selector: 'app-list-equipements',
  templateUrl: './list-equipements.component.html',
  styleUrls: ['./list-equipements.component.css']
})
export class ListEquipementsComponent implements OnInit {

  reseau : any
  plateforme : any
  equipements : any

  constructor(private route : ActivatedRoute, private plateformeService: PlateformesService, private equipementService : EquipementService) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    this.reseau = this.route.snapshot.paramMap.get('nom')
    let id = Number(this.route.snapshot.paramMap.get('id'))
    this.plateforme = await this.plateformeService.getById(id)
    this.equipements = await this.equipementService.getByPlatform(this.plateforme)

    console.log(this.equipements);
    
  }

}
