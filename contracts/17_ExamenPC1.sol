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
        console.log("Ejecutado por: 260664 - Sergio Emanuel Velasquez Reyes");
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

    function inactivarElemento(uint256 _posicion) public registrarEjecucion {
        require(_posicion < libros.length, "Posicion fuera de rango");
        libros[_posicion].estado = false;
    }

    function pintarElementosActivos() public view registrarEjecucion {
        for (uint256 i = 0; i < libros.length; i++) {
            if (libros[i].estado == true) {
                console.log(
                    "Libro activo:",
                    libros[i].id,
                    libros[i].titulo
                );
            }
        }
    }

    function pintarElementosImpares() public view registrarEjecucion {
        for (uint256 i = 0; i < libros.length; i++) {
            if (libros[i].id % 2 != 0) {
                console.log(
                    "Libro ID impar:",
                    libros[i].id,
                    libros[i].titulo
                );
            }
        }
    }
}