// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Biblioteca260664 {

    // Estructura con 3 atributos, siendo id (entero) obligatorio
    struct Libro {
        uint256 id;
        string titulo;
        string autor;
    }

    // Arreglo público del tipo de la estructura
    Libro[] public libros;

    // c) Atributo dirContrato de tipo address, público, con valor de address(this)
    address public dirContrato;

    constructor() {
        // e) Console log en el constructor
        console.log("Ejecutado por: 260664 - Sergio Emanuel Vel\u00e1squez Reyes");
        // c) Inicializar dirContrato con la dirección del contrato
        dirContrato = address(this);
    }

    // a) Método agregarElemento
    function agregarElemento(uint256 _id, string memory _titulo, string memory _autor) public {
        libros.push(Libro(_id, _titulo, _autor));
    }

    // b) Método contarElementos con console.log
    function contarElementos() public view returns (uint256) {
        console.log("Ejecutado por: 260664 - Sergio Emanuel Vel\u00e1squez Reyes");
        return libros.length;
    }

    function obtenerLibro(uint256 indice) public view returns (uint256, string memory, string memory) {
        Libro memory l = libros[indice];
        return (l.id, l.titulo, l.autor);
    }
}
