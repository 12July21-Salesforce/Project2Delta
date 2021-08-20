public with sharing class ContractInput_CX {

    private final Contract contract;

    public ContractInput_CX(Apexpages.StandardController stCon) {
        this.contract = (Contract)stCon.getRecord();
    }
}