// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol";

contract Biblioteca260664 {

    struct Libro {
        uint256 id;
        string titulo;
        string autor;
        bool estado;
    }

    Libro[] public libros;
    address public dirContrato;

    modifier registrarEjecucion() {
        console.log("Ejecutado por: 260664 - Sergio Emanuel Vel\u00e1squez Reyes");
        _;
    }

    constructor() registrarEjecucion {
        dirContrato = address(this);
    }

    function _registrarLibro(
        uint256 _id,
        string memory _titulo,
        string memory _autor
    ) internal {
        require(bytes(_titulo).length > 0, "El titulo no puede estar vacio");

        for (uint256 i = 0; i < libros.length; i++) {
            require(libros[i].id != _id, "Libro con ese ID ya existe");
        }

        libros.push(Libro(_id, _titulo, _autor, true));
    }

    function agregarElemento(
        uint256 _id,
        string memory _titulo,
        string memory _autor
    ) public registrarEjecucion {
        _registrarLibro(_id, _titulo, _autor);
    }

    function contarElementos() public view registrarEjecucion returns (uint256) {
        return libros.length;
    }

    function obtenerLibro(uint256 indice)
        public
        view
        registrarEjecucion
        returns (uint256, string memory, string memory, bool)
    {
        Libro memory l = libros[indice];
        return (l.id, l.titulo, l.autor, l.estado);
    }
}