"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestAssertValueDebugger,
	#superclass : #PackageManifest,
	#category : #'AssertValue-Debugger-Manifest'
}

{ #category : #'code-critics' }
ManifestAssertValueDebugger class >> ruleBadMessageRule2V1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Object #valuePrintOn: #false)) #'2023-09-02T00:15:31.226666+02:00') )
]
