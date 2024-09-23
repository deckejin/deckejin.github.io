---
layout: publication
type: article
author: Deckerová, Jindřiška and Faigl, Jan and Krátký, Vít
title: "Traveling Salesman Problem with neighborhoods on a sphere in reflectance transformation imaging scenarios"
journal: Expert Systems with Applications
volume: 198
number: 
pages: 116814
year: 2022
doi: 10.1016/j.eswa.2022.116814
abstract: In this paper, we propose a solution to the non-Euclidean variant of the Traveling Salesman Problem with Neighborhoods on a Sphere (TSPNS). The introduced problem formulation is motivated by practical scenarios of employing unmanned aerial vehicles in the reflectance transformation imaging (RTI).  In the RTI, a vehicle is requested to visit a set of sites at a constant distance from the object of interest and cast light from different directions to model the object from the images captured from another fixed location. Even though the problem can be formulated as an instance of the regular traveling salesman problem, we report a significant reduction of the solution cost by exploiting a non-zero tolerance on the light direction and defining the sites as regions on a sphere. The continuous neighborhoods of the TSPNS can be sampled into discrete sets, and the problem can be transformed into the generalized traveling salesman problem. However, finding high-quality solutions requires dense sampling, which increases the computational requirements. Therefore, we propose a practical heuristic solution based on the unsupervised learning of the Growing Self-Organizing Array (GSOA) that quickly finds an initial solution with the competitive quality to the sampling-based method. Furthermore, we propose a fast post-processing optimization to improve the initial solutions of both solvers. Based on the reported results, the proposed GSOA-based solver provides solutions of a similar quality to the transformation approach while it is about two orders of magnitude less computationally demanding. 
image: /images/eswa22tspns.png
url2: https://www.sciencedirect.com/science/article/pii/S0957417422002718?via%3Dihub
web: deckerova22eswa
citation: "
@article{deckerova22eswa,<br>
	&emsp; author = {Deckerová, Jindřiška and Faigl, Jan and Krátký, Vít},<br>
	&emsp; title = {Traveling Salesman Problem with neighborhoods on a sphere in reflectance transformation imaging scenarios},<br>
	&emsp; journal= {Expert Systems with Applications},<br>
	&emsp; volume= {198},<br>
	&emsp; number= {},<br>
	&emsp; pages = {116814},<br>
	&emsp; year = {2022},<br>
	&emsp; doi = {10.1016/j.eswa.2022.116814},<br>
}


"
excerpt_separator: <!--more-->
---
*The non-Euclidean Traveling Salesman Problem with Neighborhoods on a Sphere (TSPNS) is motivated by practical scenarios of employing unmanned aerial vehicles in the reflectance transformation imaging (RTI). We propose an unsupervised learning of the Growing Self-Organizing Array (GSOA) and fast post-processing procedure.*
<!--more-->

