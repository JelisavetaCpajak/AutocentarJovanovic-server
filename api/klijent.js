const express = require("express");
const pool = require("../db/index").pool;
const routes = express.Router();
const uuid = require("uuid");
const mysql = require("../db/index.js");

// uzmi klijente sa imenomPrezimenom ili nazivomFirme
routes.get("/ime/:imeKlijentaIliFirme", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        pool.query(
          "select * from klijent where ime_prezime_klijenta=? || ime_firme=?",
          [req.params.imeKlijentaIliFirme, req.params.imeKlijentaIliFirme],
          (err, results) => {
            if (err) {
              return reject(err);
            } else {
              return resolve(results);
            }
          }
        );
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

// uzmi sve klijente
routes.get("/", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        pool.query("select * from klijent ", (err, results) => {
          if (err) {
            return reject(err);
          } else {
            return resolve(results);
          }
        });
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

// pretrazi klijenta po id-u
routes.get("/id/:idKlijenta", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        pool.query(
          "select * from klijent where id_klijenta=?",
          [req.params.idKlijenta],
          (err, results) => {
            if (err) {
              return reject(err);
            } else {
              return resolve(results);
            }
          }
        );
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

// vrati klijenta za vozilo (po broju sasije)
routes.get("/brojSasije/:brojSasije", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        pool.query(
          "select * from klijent k join vozilo v on(k.id_klijenta=v.id_klijenta) where v.broj_sasije=?",
          [req.params.brojSasije],
          (err, result) => {
            if (err) {
              return reject(err);
            } else {
              return resolve({
                id_klijenta: result[0].id_klijenta,
                jmbg: result[0].jmbg,
                broj_lk: result[0].broj_lk,
                datum_vazenja_lk_klijenta: result[0].datum_vazenja_lk_klijenta,
                ime_prezime_klijenta: result[0].ime_prezime_klijenta,
                adresa_klijenta: result[0].adresa_klijenta,
                ime_firme: result[0].ime_firme,
                pib: result[0].pib,
                adresa_firme: result[0].adresa_firme,
              });
            }
          }
        );
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

// kreiraj klijenta
routes.post("/", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        let klijentID = uuid.v4();
        console.log("klijent: ", req.body.data.klijent);
        pool.query(
          "insert into klijent (id_klijenta, jmbg, broj_lk, datum_vazenja_lk_klijenta, ime_prezime_klijenta, adresa_klijenta, ime_firme, pib, adresa_firme) values (?,?,?,?,?,?,?,?,?)",
          [
            klijentID,
            req.body.data.klijent.jmbg,
            req.body.data.klijent.broj_lk,
            req.body.data.klijent.datum_vazenja_lk_klijenta,
            req.body.data.klijent.ime_prezime_klijenta,
            req.body.data.klijent.adresa_klijenta,
            req.body.data.klijent.ime_firme,
            req.body.data.klijent.pib,
            req.body.data.klijent.adresa_firme,
          ],
          (err, results) => {
            if (err) {
              return reject(err);
            } else {
              return resolve({ idKlijenta: klijentID });
            }
          }
        );
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});

//obrisi klijenta
routes.delete("/obrisi/:klijentID", async (req, res) => {
  try {
    res.json(
      await new Promise((resolve, reject) => {
        let klijentID = req.params.klijentID;
        // console.log("klijent: ", req.body.data.klijent);
        pool.query(
          "delete from klijent where id_klijenta=?",
          [klijentID],
          (err, results) => {
            if (err) {
              return reject(err);
            } else {
              return resolve(results);
            }
          }
        );
      })
    );
  } catch (e) {
    console.log(e);
    res.sendStatus(500);
  }
});
// izmeni racun
routes.put("/izmena", async (req, res) => {
  try {
    console.log("izmeniKlijenta->klijent: ", req.body.klijent);
    const connection = await mysql.connection();
    try {
      console.log("at izmeniKlijenta...");
      await connection.query("START TRANSACTION");

      //ovo sam dodala jer ne azurira ukupne vrednosti u racunu kad se izmeni racun
      await connection.query(
        "update klijent set jmbg=?, broj_lk=?, datum_vazenja_lk_klijenta=?, ime_prezime_klijenta=?, adresa_klijenta=?, ime_firme=?, pib=?, adresa_firme=? where id_klijenta=? ",
        [
          req.body.data.klijent.jmbg,
          req.body.data.klijent.broj_lk,
          req.body.data.klijent.datum_vazenja_lk_klijenta,
          req.body.data.klijent.ime_prezime_klijenta,
          req.body.data.klijent.adresa_klijenta,
          req.body.data.klijent.ime_firme,
          req.body.data.klijent.pib,
          req.body.data.klijent.adresa_firme,
          req.body.data.klijent.id_klijenta,
        ]
      );
      res.json(await connection.query("COMMIT"));
    } catch (err) {
      await connection.query("ROLLBACK");
      console.log("ROLLBACK at izmeniKlijenta", err);
      throw err;
    } finally {
      await connection.release();
    }
  } catch (e) {
    console.log("error: ", e);
    res.sendStatus(500);
  }
});

module.exports = routes;
