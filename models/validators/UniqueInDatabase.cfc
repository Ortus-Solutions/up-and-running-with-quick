component implements="cbvalidation.models.validators.IValidator" singleton {

	/**
	 * Will check if an incoming value validates
	 * @validationResultThe result object of the validation
	 * @targetThe target object to validate on
	 * @fieldThe field on the target object to validate on
	 * @targetValueThe target value to validate
	 */
	boolean function validate(
		required any validationResult,
		required any target,
		required string field,
		any targetValue,
		any validationData,
		struct rules
	){
		var exists = queryExecute(
			"SELECT 1 FROM #arguments.validationData.table# WHERE #arguments.validationData.column# = ?",
			[ arguments.targetValue ]
		).RecordCount > 0;

		if ( !exists ) {
			return true;
		}

		validationResult.addError(
			validationResult.newError(
				argumentCollection = {
					message : "The #arguments.validationData.column# '#arguments.targetValue#' is already in use",
					field : arguments.field,
					validationType : getName(),
					validationData : arguments.validationData
				}
			)
		);
		return false;
	}

	/**
	 * Get the name of the validator
	 */
	string function getName(){
		return "UniqueInDatabase";
	}

}
