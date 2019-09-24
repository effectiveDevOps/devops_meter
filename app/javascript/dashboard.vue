<template>
  <div id="app">
    <h1>DevOps Score by Group</h1>
    <div class="container">
      <div v-for="(group,index) in groups" :key="index" class="each-group">
        <h3>{{ group.name }}</h3>
        <p>DevOps Score: {{group.score}}</p>
        <RadarChart :chartdata='group.chartdata' :options='group.options' />
      </div>
    </div>
  </div>
</template>

<script>
import RadarChart from 'components/radarChart'
import axios from 'axios';
export default {
  components: {
    RadarChart
  },
  data: function () {
    return {
      groups: [],
      options: {
        scale: {
            ticks: {
                beginAtZero: true,
                max: 100,
                min: 0,
                stepSize: 50
            }
        },
        legend: {
              display: false
        }
      }
    }
  },
  created: function(){
    let _this = this;
    axios
      .get('/dashboard/api')
      .then((res) => {
        _this.groups = res.data.data;
        console.log(_this.groups);
        var rand = function(n){return Math.floor(Math.random() * n) + 1;};
        _this.groups.forEach(e => {
          e.chartdata.datasets[0].backgroundColor = 'hsla('+rand(360)+', 80%, 80%,0.2)';
          Object.assign(e,{options: _this.options});
          console.log(e);
        });
        _this.groups.sort(function(l,r){return r.score - l.score;});
      });
  }
}
</script>

<style scoped>
h3, h1, p {
  text-align: center;
}
/* p {
  font-size: 2em;
  text-align: center;
} */
.each-group {
  width: 300px;
  margin: 0px 30px;
}
.container {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
}
</style>
