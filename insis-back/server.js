const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');

const app = express();

app.use(cors({
    origin: '*'
}));
app.use(bodyParser.json());


// database connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Umhplinsis15',
    database: 'insis_kitweb_database',
    port : 3306
});

// check database connection 
db.connect(err => {
    if (err) {console.log(err, 'dbERR');}
    else console.log('db connected ...');
});

// TODO: FAIRE un Fichier pour chaque type de donnee 
// TODO: FAIRE un GET ALL Reseau
// TODO: FAIRE un GET by id Reseau 
// TODO: FAIRE un UPDATE by id Reseau 
// TODO: FAIRE un DELETE by id Reseau 

/***
 * ********* PARTIE RESEAUX *************
 */
// GET ALL Reseau
app.get('/reseaux', (req, res) => {
    let query = `select * from Reseau`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});

// GET Reseau by id
app.get('/reseaux/:id', (req, res) => {
    let query = `select * from Reseau where id_reseau = '${req.params.id}'`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});

// POST Reseau  
app.post('/reseaux', (req, res) => {

    let b = req.body;
    let query = `insert 
                into Reseau(nom_1_reseau, nom_2_reseau, url_img_acceuil_reseau, nom_general_nat_reseau, desc_generale_nat_reseau, desc_page_eqt_reseau, desc_page_real_reseau, url_img_page_real_reseau, titre_page_real_reseau, desc_page_modes_reseau, desc_page_contact_reseau, id_site)
                values('${b.nom_1}', '${b.nom_2}', '${b.url_img_acceuil}', '${b.nom_general_nat}', '${b.desc_generale_nat}', '${b.desc_page_eqt}', '${b.desc_page_real}', '${b.url_img_page_real}', '${b.titre_page_real}', '${b.desc_page_modes}', '${b.desc_page_contact}', (SELECT id FROM Sites WHERE nom_1_site = '${b.nom_site}' LIMIT 1));`
    
    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
})

// UPDATE Reseau
app.put('/reseaux/:id', (req, res) => {

    let b = req.body;
    let query = `update Reseau set nom_1_reseau = '${b.nom_1_reseau}', nom_2_reseau = '${b.nom_2_reseau}', url_img_acceuil_reseau = '${b.url_img_acceuil_reseau}', nom_general_nat_reseau = '${b.nom_general_nat_reseau}', desc_generale_nat_reseau = '${b.desc_generale_nat_reseau}', desc_page_eqt_reseau = '${b.desc_page_eqt_reseau}', desc_page_real_reseau = '${b.desc_page_real_reseau}', url_img_page_real_reseau = '${b.url_img_page_real_reseau}', titre_page_real_reseau = '${b.titre_page_real_reseau}', desc_page_modes_reseau = '${b.desc_page_modes_reseau}', desc_page_contact_reseau = '${b.desc_page_contact_reseau}', id_site = '${b.id_site}'
                where id_reseau = ${req.params.id}`

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    });
});

// DELETE Reseau
app.delete('/reseaux/:id', (req, res) => {

    let query = `delete from Reseau where id_reseau = '${req.params.id}'`

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
});

/***
 * ********* PARTIE PLATEFORMES *************
 */
// GET All Plateformes
app.get('/plateformes', (req, res) => {
    let query = `select * from Plateforme`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});

// GET Plateforme by Id 
app.get('/plateformes/:id', (req, res) => {
    let query = `select * from Plateforme where id_plateforme = ${req.params.id}`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});

// GET Plateformes by Reseau (id du reseau)
app.get('/reseau/:id/plateformes_du_reseau/', (req, res) => {
    let query = `SELECT * FROM Plateforme where id_reseau = '${req.params.id}'`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');

        if (result?.length > 0) res.send(result);
        else {
            res.send({ header: `not found`});
        }
    });
});

// POST Plateforme 
app.post('/plateformes', (req, res) => {

    let b = req.body;
    let query = `insert 
                into Plateforme(nom_1_plateforme, nom_2_plateforme, url_img_acceuil_plateforme, nom_general_nat_plateforme, desc_generale_nat_plateforme, desc_page_eqt_plateforme, desc_page_real_plateforme, url_img_page_real_plateforme, titre_page_real_plateforme, desc_page_modes_plateforme, desc_page_contact_plateforme, id_site, id_reseau) 
                values('${b.nom_1_plateforme}', '${b.nom_2_plateforme}', '${b.url_img_acceuil_plateforme}', '${b.nom_general_nat_plateforme}', '${b.desc_generale_nat_plateforme}', '${b.desc_page_eqt_plateforme}', '${b.desc_page_real_plateforme}', '${b.url_img_page_real_plateforme}', '${b.titre_page_real_plateforme}', '${b.desc_page_modes_plateforme}', '${b.desc_page_contact_plateforme}', (SELECT id_site FROM Sites WHERE nom_1_site = '${b.nom_site}' LIMIT 1),  (SELECT id_reseau FROM Reseau WHERE nom_1_reseau = '${b.nom_reseau}' LIMIT 1));`
    
    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
});

// UPDATE Plateforme by Id 
app.put('/plateformes/:id', (req, res) => {
    let b = req.body;
    let query = `update Plateforme set nom_1_plateforme = '${b.nom_1_plateforme}', nom_2_plateforme = '${b.nom_2_plateforme}', url_img_acceuil_plateforme = '${b.url_img_acceuil_plateforme}', nom_general_nat_plateforme = '${b.nom_general_nat_plateforme}', desc_generale_nat_plateforme = '${b.desc_generale_nat_plateforme}', desc_page_eqt_plateforme = '${b.desc_page_eqt_plateforme}', desc_page_real_plateforme = '${b.desc_page_real_plateforme}', url_img_page_real_plateforme = '${b.url_img_page_real_plateforme}', titre_page_real_plateforme = '${b.titre_page_real_plateforme}', desc_page_modes_plateforme = '${b.desc_page_modes_plateforme}', desc_page_contact_plateforme = '${b.desc_page_contact_plateforme}', titre_page_acceuil_plateforme = '${b.titre_page_acceuil_plateforme}', desc_page_acceuil_plateforme = "${b.desc_page_acceuil_plateforme}", id_site = '${b.id_site}', id_reseau = '${b.id_reseau}'
                where id_plateforme = ${req.params.id}`;
    
    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else if(result.affectedRows > 0) res.send(true);
        //else res.send(result);
    });
});

// DELETE single equipement
app.delete('/plateformes/:id', (req, res) => {

    let query = `delete from Plateforme where id_plateforme = '${req.params.id}'`

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
});


/***
 * ********* PARTIE EQUIPEMENTS *************
 */
// GET All equipements
app.get('/equipements', (req, res) => {
    let query = `select * from Equipements`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});

// GET single equipement by Id
app.get('/equipements/:id', (req, res) => {
    let query = `select * from Equipements where id_equipement = ${req.params.id}`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');

        if (result?.length > 0) res.send(result);
        else {
            res.send({ header: `not found`});
        }
    });
});


// GET equipements by Reseau (id du reseau)
app.get('/equipements_du_reseau/:id', (req, res) => {
    let query = `SELECT * FROM Plateforme P JOIN Equipements E ON E.id_plateforme = P.id_plateforme WHERE P.id_reseau = '${req.params.id}'`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');

        if (result?.length > 0) res.send(result);
        else {
            res.send({ header: `not found`});
        }
    });
});

// GET equipements by Plateforme (id de la plateforme)
app.get('/equipements_de_la_plateforme/:id', (req, res) => {
    let query = `SELECT * FROM Equipements E JOIN Plateforme P ON E.id_plateforme = P.id_plateforme WHERE E.id_plateforme = '${req.params.id}'`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');

        if (result?.length > 0) res.send(result);
        else {
            res.send({ header: `not found`});
        }
    });
});

// POST Equipement 
app.post('/equipements', (req, res) => {

    let b = req.body;
    let query = `insert 
                into Equipements(nom_1_equipement, nom_2_equipement, url_img_equipement, constructeur_equipement, modele_equipement, lieu_stockage_equipement, description_equipement, niv_utilisation_equipement, habilitations_equipement, is_transportable_equipement, id_user, id_plateforme, id_sous_categorie_eqt) 
                values('${b.nom_1_equipement}', '${b.nom_2_equipement}', '${b.url_img_equipement}', '${b.constructeur_equipement}', '${b.modele_equipement}', '${b.lieu_stockage_equipement}', '${b.description_equipement}', '${b.niv_utilisation_equipement}', '${b.habilitations_equipement}', '${b.is_transportable_equipement}', '${b.id_user}',  '${b.id_plateforme}', '${b.id_sous_categorie_eqt}');`
    
    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
})

// UPDATE equipement
app.put('/equipements/:id', (req, res) => {

    let b = req.body;
    let query = `update Equipements set nom_1_equipement = '${b.nom_1_equipement}', nom_2_equipement = '${b.nom_2_equipement}', url_img_equipement = '${b.url_img_equipement}', constructeur_equipement = '${b.constructeur_equipement}', modele_equipement = '${b.modele_equipement}', lieu_stockage_equipement = '${b.lieu_stockage_equipement}', description_equipement = '${b.description_equipement}', niv_utilisation_equipement = '${b.niv_utilisation_equipement}', habilitations_equipement = '${b.habilitations_equipement}', is_transportable_equipement = '${b.is_transportable_equipement}', id_user = '${b.id_user}', id_plateforme = '${b.id_plateforme}', id_sous_categorie_eqt = '${b.id_sous_categorie_eqt}'
                where id_equipement = ${req.params.id}`

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    });
});

// DELETE single equipement
app.delete('/equipements/:id', (req, res) => {

    let query = `delete from Equipements where id_equipement = '${req.params.id}'`

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        else res.send(result);
    })
});

/***
 * ********* PARTIE OPTIONS *************
 */
// GET All options from one specific equipement
app.get('/option_specific/:id', (req, res) => {
    let query = `SELECT Options.nom_option, Options.desc_option
                    FROM Option_equipement 
                        INNER JOIN Options 
                        ON Option_equipement.id_option = Options.id_option
                        WHERE Option_equipement.id_equipement = ${req.params.id}`;

    db.query(query, (err, result) => {
        if (err) console.log(err, 'DATABASE ERROR ON QUERY');
        if (result?.length > 0) res.send(result);
    });
});


app.listen(3000, () => {
    console.log('server is running');
});
