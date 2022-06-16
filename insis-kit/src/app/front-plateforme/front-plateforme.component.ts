import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PlateformesService } from '../services/plateformes.service';

@Component({
  selector: 'app-front-plateforme',
  templateUrl: './front-plateforme.component.html',
  styleUrls: ['./front-plateforme.component.css']
})
export class FrontPlateformeComponent implements OnInit {

  plateforme : any

  constructor(private route : ActivatedRoute,private pfService : PlateformesService) { }

  ngOnInit(): void {
    this.loadData()
  }

  async loadData() {
    let id = Number(this.route.snapshot.paramMap.get('id'))
    this.plateforme = await this.pfService.getById(id)
    console.log(this.plateforme);
    
  }
}
