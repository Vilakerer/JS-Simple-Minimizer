# simple javascript minification tool using google's closure compiler
# By: Diego Diaz

# checking if java is installed
if command -v java
then
	# downloading latest closure-compiler
	wget https://dl.google.com/closure-compiler/compiler-latest.zip
	# the closure-compiler*.jar structure avoids having to point latest date/version
	unzip compiler-latest.zip closure-compiler*.jar
	for file in ./*.js
	# this will pick up every .js file in the current directory and run it through the compiler
	do
		# .min.js files can be found in a folder named "minified" inside the current directory
		java -jar closure-compiler*.jar --use_types_for_optimization false --js "${file}" --js_output_file ./minified/"${file%.js}".min.js
		echo "${file} was minified"
	done
	# clean up
	rm compiler-latest.zip closure-compiler*.jar
else
	echo "Java needs to be installed to run Google's closure compiler, please check https://www.java.com/en/download/ for instructions"
fi
exit