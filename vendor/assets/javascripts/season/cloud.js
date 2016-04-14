//= require three.min
//= require Detector
function init() {
	$("body").append("<div id='WebGL-output'></div>");
	var styleForOutput = {
		'top': '0px',
		'left': '0px',
		'right': '0px',
		'bottom': '0px',
		'z-index': '-10',
		'position': 'fixed',
		'margin': 0,
		'overflow': 'hidden',
		'filter': 'alpha(opacity=100)',
		'-moz-opacity': '0.4',
		'-khtml-opacity': '0.4',
		'opacity': '0.4'
	};
	$("#WebGL-output").css(styleForOutput);
	if (!Detector.webgl) Detector.addGetWebGLMessage();
	var camera, scene, renderer;
	var cameraCube, sceneCube;
	var mesh, lightMesh, geometry, webGLRenderer;
	var spheres = [];
	var directionalLight, pointLight;
	var mouseX = 0,
		mouseY = 0;
	var windowHalfX = window.innerWidth / 2;
	var windowHalfY = window.innerHeight / 2;
	document.addEventListener('mousemove', onDocumentMouseMove, false);
	camera = new THREE.PerspectiveCamera(60, window.innerWidth / window.innerHeight, 1, 100000);
	camera.position.z = 3200;
	cameraCube = new THREE.PerspectiveCamera(60, window.innerWidth / window.innerHeight, 1, 100000);
	scene = new THREE.Scene();
	sceneCube = new THREE.Scene();
	var geometry = new THREE.SphereBufferGeometry(100, 32, 16);
	var path = "images/";
	var format = '.jpg';
	var urls = [
		path + 'px' + format, path + 'nx' + format,
		path + 'py' + format, path + 'ny' + format,
		path + 'pz' + format, path + 'nz' + format
	];
	var textureCube = new THREE.CubeTextureLoader().load(urls);
	textureCube.mapping = THREE.CubeRefractionMapping;
	var material = new THREE.MeshBasicMaterial({
		color: 0xffffff,
		envMap: textureCube,
		refractionRatio: 0.95
	});
	// for (var i = 0; i < 500; i++) {
	// 	var mesh = new THREE.Mesh(geometry, material);
	// 	mesh.position.x = Math.random() * 10000 - 5000;
	// 	mesh.position.y = Math.random() * 10000 - 5000;
	// 	mesh.position.z = Math.random() * 10000 - 5000;
	// 	mesh.scale.x = mesh.scale.y = mesh.scale.z = Math.random() * 3 + 1;
	// 	scene.add(mesh);
	// 	spheres.push(mesh);
	// }
	// Skybox
	var shader = THREE.ShaderLib["cube"];
	shader.uniforms["tCube"].value = textureCube;
	var material = new THREE.ShaderMaterial({
			fragmentShader: shader.fragmentShader,
			vertexShader: shader.vertexShader,
			uniforms: shader.uniforms,
			depthWrite: false,
			side: THREE.BackSide
		}),
		mesh = new THREE.Mesh(new THREE.BoxGeometry(100, 100, 100), material);
	sceneCube.add(mesh);
	//
	webGLRenderer = new THREE.WebGLRenderer();
	webGLRenderer.setPixelRatio(window.devicePixelRatio);
	webGLRenderer.setSize(window.innerWidth, window.innerHeight);
	webGLRenderer.autoClear = false;
	document.getElementById("WebGL-output").appendChild(webGLRenderer.domElement);
	//
	window.addEventListener('resize', onWindowResize, false);
	animate();


	function onWindowResize() {
		windowHalfX = window.innerWidth / 2,
			windowHalfY = window.innerHeight / 2,
			camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		cameraCube.aspect = window.innerWidth / window.innerHeight;
		cameraCube.updateProjectionMatrix();
		renderer.setSize(window.innerWidth, window.innerHeight);
	}

	function onDocumentMouseMove(event) {
		mouseX = (event.clientX - windowHalfX) * 10;
		mouseY = (event.clientY - windowHalfY) * 10;
	}
	//
	function animate() {
		requestAnimationFrame(animate);
		render();
	}

	function render() {
		var timer = 0.0001 * Date.now();
		for (var i = 0, il = spheres.length; i < il; i++) {
			var sphere = spheres[i];
			sphere.position.x = 5000 * Math.cos(timer + i);
			sphere.position.y = 5000 * Math.sin(timer + i * 1.1);
		}
		camera.position.x += (mouseX - camera.position.x) * .05;
		camera.position.y += (-mouseY - camera.position.y) * .05;
		camera.lookAt(scene.position);
		cameraCube.rotation.copy(camera.rotation);
		webGLRenderer.render(sceneCube, cameraCube);
		webGLRenderer.render(scene, camera);
	}
}
window.onload = init;