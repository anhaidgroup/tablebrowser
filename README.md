<div class="section" id="user-manual">
<span id="user"></span><h1>User Manual<a class="headerlink" href="#user-manual" title="Permalink to this headline">¶</a></h1>
<div class="section" id="overview">
<h2>Overview<a class="headerlink" href="#overview" title="Permalink to this headline"></a></h2>
<p>Cloud browser is a tool for easy visualization of large csv files. This tool allows you to upload csv files and view
them as a map i.e. perform pan and zoom operations through UI. Cloud browser processes csv files on the fly and has a
low latency for initial loading and browsing as compared to traditional tools such as Apple Numbers and Microsoft Excel.
It is available as a micro-cloud service, hence can be hosted in one place and then the users do not need to worry about
any requirements or dependencies other than a web browser.</p>
</div>
<div class="section" id="requirements">
<h2>Requirements<a class="headerlink" href="#requirements" title="Permalink to this headline"></a></h2>
<p>Cloud browser is configured to use a maximum of 30 GB of disk space. This tool has been tested for the linux
environment. In order to set up cloud browser on a host, a python 3 environment will be required which could be native,
virtual or a container. Python pip is required for installing dependencies. Wkhtmltopdf package needs to be installed on
the machine. Write permissions are required on the ‘media’ folder where temporary data will be stored.</p>
</div>
<div class="section" id="installation">
<h2>Installation<a class="headerlink" href="#installation" title="Permalink to this headline"></a></h2>
<ul class="simple">
<li>First get account credentials for an ec2 Linux machine and set a security policy that will allow access to port 80 of</li>
</ul>
<p>the machine.</p>
<ul>
<li><p class="first">After ssh into the amazon box, update packages and install docker</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">yum</span> <span class="n">update</span> <span class="o">-</span><span class="n">y</span>
<span class="n">sudo</span> <span class="n">yum</span> <span class="n">install</span> <span class="o">-</span><span class="n">y</span> <span class="n">docker</span>
</pre></div>
</div>
</li>
<li><p class="first">Start Docker service</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">service</span> <span class="n">docker</span> <span class="n">start</span>
</pre></div>
</div>
</li>
<li><p class="first">Run the docker container</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">docker</span> <span class="n">run</span> <span class="o">-</span><span class="n">p</span> <span class="mi">8000</span><span class="p">:</span><span class="mi">8000</span> <span class="n">kaushikc92</span><span class="o">/</span><span class="n">cloud_browser</span><span class="p">:</span><span class="n">v1</span>
</pre></div>
</div>
</li>
<li><p class="first">Install and start nginx</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">yum</span> <span class="n">install</span> <span class="n">nginx</span>
<span class="n">sudo</span> <span class="n">service</span> <span class="n">nginx</span> <span class="n">start</span>
</pre></div>
</div>
</li>
<li><p class="first">Edit the nginx configs</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">vi</span> <span class="o">/</span><span class="n">etc</span><span class="o">/</span><span class="n">nginx</span><span class="o">/</span><span class="n">conf</span><span class="o">.</span><span class="n">d</span><span class="o">/</span><span class="n">virtual</span><span class="o">.</span><span class="n">conf</span>
</pre></div>
</div>
</li>
<li><p class="first">Add the following line to the above file inside the http object</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">client_max_body_size</span> <span class="mi">200</span><span class="n">M</span><span class="p">;</span>
</pre></div>
</div>
</li>
<li><p class="first">Restart nginx to reflect new changes</p>
<div class="highlight-default"><div class="highlight"><pre><span></span><span class="n">sudo</span> <span class="n">service</span> <span class="n">nginx</span> <span class="n">restart</span>
</pre></div>
</div>
</li>
<li><p class="first">You could also build your own docker image from the source code and run it in the docker container.</p>
</li>
<li><p class="first">Another option is to clone the source code and host it elsewhere without using docker.</p>
</li>
</ul>
</div>
<div class="section" id="usage">
<h2>Usage<a class="headerlink" href="#usage" title="Permalink to this headline"></a></h2>
<p>This tool is pretty straight forward to use. The index page opens up a file manager portal where you can upload a csv
file, choose to browse one of the csv files already uploaded, delete a file or download a file. Clicking on the csv file
will open the file in a map window where you can use pan and zoom operations to browse it. A slider is available to the
right of the map window which can be used to quickly jump to any portion of a large csv file.</p>
</div>
</div>
