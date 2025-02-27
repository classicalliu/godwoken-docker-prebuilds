#!/bin/bash

check_scripts_files_exists(){
    local -a arr=( 
        "eth-account-lock"   "deposit-lock"     "custodian-lock"  "stake-lock"
        "tron-account-lock"  "withdrawal-lock"  "challenge-lock"  "omni_lock"
		
        "always-success"     "state-validator"
        
        "meta-contract-generator"  "sudt-generator"  
		"meta-contract-validator"  "sudt-validator" 
	) 
    local path=`pwd`/test-result/scripts/godwoken-scripts
	check_multiple_files_exists "$path" "${arr[@]}"
}

check_polyjuice_files_exists(){
    local -a arr=( 
		"generator"        "generator_log"        "validator"        "validator_log"
        "generator.debug"  "generator_log.debug"  "validator.debug"  "validator_log.debug"
        "generator.aot"    "generator_log.aot"    "validator.aot"    "validator_log.aot"
        
        "eth_addr_reg_generator"        "eth_addr_reg_validator"
        "eth_addr_reg_generator.debug"  "eth_addr_reg_validator.debug"
	) 
    local path=`pwd`/test-result/scripts/godwoken-polyjuice
    check_multiple_files_exists "$path" "${arr[@]}" 
}

check_multiple_files_exists(){
    local check_path=$1
    local -a arr=("$@")
    
    cd $check_path
	for i in "${arr[@]}" 
	do 
        if [ "$i" != "$check_path" ]; then # the first one is just the check_path.
	      [ -f "$i" ] && echo "test pass, found $i." || (echo "test failed, $i not found"; exit 1) ;
        fi
    done 
}
