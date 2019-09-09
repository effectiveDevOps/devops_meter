
// https://vue-chartjs.org/ja/guide/#最初のチャートの作成
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
export default {
  components: {
    RadarChart
  },
  data: function () {
    return {
      groups: [
        {
          name: 'SOK',
          score: 90,
          chartdata: {
            labels: ["シンクロ度", "コラボレーション", "アフィニティ", "ツール", "スケーリング"],
            datasets: [
              {
                label: "グループ平均",
                data: [40, 50, 60, 70, 80]
              }
            ]
          }
        }
      ],
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
    // debug data
    let _this = this;
    ["S","O","K"].forEach(e1 => {
      ["S","O","K"].forEach(e2 => {
        ["S","O","K"].forEach(e3 => {
          var tmp = JSON.parse(JSON.stringify(_this.groups[0]));
          var rand = function(n){
              return Math.floor(Math.random() * n) + 1;
          };
          _this.groups.push(tmp);
          //　creating demo data.
          _this.groups[_this.groups.length-1].name = e1+e2+e3;
          _this.groups[_this.groups.length-1].chartdata.datasets[0].data = [rand(100),rand(100),rand(100),rand(100),rand(100)];
          var arr = _this.groups[_this.groups.length-1].chartdata.datasets[0].data;
          _this.groups[_this.groups.length-1].chartdata.datasets[0].backgroundColor = 'hsla('+rand(360)+', 80%, 80%,0.2)';
          _this.groups[_this.groups.length-1].score = (arr[0])*(arr[1]+arr[2]+arr[3]+arr[4])/4/100;
          Object.assign(_this.groups[_this.groups.length-1],{options: _this.options});
        });
      });
    });
    this.groups.shift();
    this.groups.sort(function(l,r){return r.score - l.score;});
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
