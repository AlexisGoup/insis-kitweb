import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Plateforme } from '../model/plateforme';
import { Reseau } from '../model/reseau';

@Injectable({
  providedIn: 'root'
})
export class PlateformesService {

  url : string = 'http://localhost:3000'

  constructor(private http : HttpClient) { }

  getAll() : Observable<Plateforme[]> {
    return this.http.get<Plateforme[]>(this.url + '/plateformes')
  }

  async getByReseau(reseau : Reseau) : Promise<Plateforme[]> {
    let find : Plateforme[] = []
    let plateformes : Plateforme[] = await this.getAll().toPromise()

    plateformes.forEach(element => {
      if (element.id_reseau === reseau.id_reseau) find.push(element)
    });
    
    return find
  }

  async getById(id : number) {
    let find 
    let list = await this.getAll().toPromise()
    
    list.forEach(element => {
      if (element.id_plateforme === id) find = element
    });
    
    
    return find
  }

  updateById(plateforme : Plateforme) {
    let body = {
      nom_1_plateforme :  plateforme.nom_1_plateforme,
      nom_2_plateforme : plateforme.nom_2_plateforme,
      url_img_acceuil_plateforme : plateforme.url_img_acceuil_plateforme,
      titre_page_acceuil_plateforme : plateforme.titre_page_acceuil_plateforme,
      desc_page_acceuil_plateforme : plateforme.desc_page_acceuil_plateforme,
      nom_general_nat_plateforme : plateforme.nom_general_nat_plateforme,
      desc_generale_nat_plateforme : plateforme.desc_generale_nat_plateforme,
      desc_page_eqt_plateforme : plateforme.desc_page_eqt_plateforme,
      desc_page_real_plateforme : plateforme.desc_generale_nat_plateforme,
      url_img_page_real_plateforme : plateforme.url_img_page_real_plateforme,
      titre_page_real_plateforme : plateforme.titre_page_real_plateforme,
      desc_page_modes_plateforme : plateforme.desc_page_modes_plateforme,
      desc_page_contact_plateforme : plateforme.desc_page_contact_plateforme,
      id_site : plateforme.id_site,
      id_reseau : plateforme.id_reseau
    }
    return this.http.put<any>(this.url + '/plateformes/' + plateforme.id_plateforme, body) //<boolean>(this.url + '/plateformes/' + plateforme.id_plateforme)
  }
}
