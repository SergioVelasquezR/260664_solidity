// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Biblioteca260664 {

    // a) Estructura con 3 atributos, siendo id (entero) obligatorio
    struct Libro {
        uint256 id;
        string titulo;
        string autor;
    }

    // b) Arreglo público del tipo de la estructura
    Libro[] public libros;

    constructor() {
        // c) Console log con el formato requerido
        console.log("Ejecutado por : 260664 - Sergio Emanuel Vel\u00e1squez Reyes");
    }

    function agregarLibro(uint256 _id, string memory _titulo, string memory _autor) public {
        libros.push(Libro(_id, _titulo, _autor));
    }

    function obtenerLibro(uint256 indice) public view returns (uint256, string memory, string memory) {
        Libro memory l = libros[indice];
        return (l.id, l.titulo, l.autor);
    }

    function totalLibros() public view returns (uint256) {
        return libros.length;
    }
}
