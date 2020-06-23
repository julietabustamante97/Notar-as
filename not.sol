pragma solidity ^0.4.16;

contract notario{
    
    struct Usuario {
		string nom;
		string rut;
		string id;
		address dueno;
	}
	
//	mapping (uint => notario) public peopleData; 
	
	function notario () {
		
	}
	
	function addDocumento (string _id, string _rut, string _nom) {
	        Usuario({
	            dueno: msg.sender,
	            nom: _nom,
	            rut: _rut,
	            id: _id
	    });
	}
	

}
