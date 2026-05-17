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

    mapping(uint256 => Libro) public libros;
    uint256[] public idsLibros;
    uint256 public cantidad;
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
        require(libros[_id].id == 0, "Libro con ese ID ya existe");

        libros[_id] = Libro(_id, _titulo, _autor, true);
        idsLibros.push(_id);
        cantidad = cantidad + 1;
    }


    function agregarElemento(
        uint256 _id,
        string memory _titulo,
        string memory _autor
    ) public registrarEjecucion {
        _registrarLibro(_id, _titulo, _autor);
    }

    function contarElementos() public view registrarEjecucion returns (uint256) {
        return cantidad;
    }

    function obtenerLibro(uint256 _id)
        public
        view
        registrarEjecucion
        returns (uint256, string memory, string memory, bool)
    {
        require(libros[_id].id != 0, "Libro no existe");
        Libro memory l = libros[_id];
        return (l.id, l.titulo, l.autor, l.estado);
    }

    function inactivarElemento(uint256 _id) public registrarEjecucion {
        require(libros[_id].id != 0, "Libro no existe");
        libros[_id].estado = false;
    }

    function pintarElementosActivos() public view registrarEjecucion {
        for (uint256 i = 0; i < idsLibros.length; i++) {
            uint256 idActual = idsLibros[i];
            if (libros[idActual].estado == true) {
                console.log(
                    "Libro activo:",
                    libros[idActual].id,
                    libros[idActual].titulo
                );
            }
        }
    }

    function pintarElementosImpares() public view registrarEjecucion {
        for (uint256 i = 0; i < idsLibros.length; i++) {
            uint256 idActual = idsLibros[i];
            if (libros[idActual].id % 2 != 0) {
                console.log(
                    "Libro ID impar:",
                    libros[idActual].id,
                    libros[idActual].titulo
                );
            }
        }
    }
}