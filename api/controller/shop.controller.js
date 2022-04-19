const {productListService} = require("../services/product.service.js");
const {BrandModel} = require("../../models/brand.model.js");
const {isNumber} = require("../../utils");
const {GoodsTagModel} = require("../../models/goods_tag.model.js");
const {productService} = require("../services/product.service.js");
const {backMsg400} = require("../../utils/backMsg.js");
const {GoodUserModel} = require("../../models/good_user.model.js");
const {ajvValid} = require("../../utils/ajv-verify.js");
const {backMsg200} = require("../../utils/backMsg.js");
const {GoodsSkuModel} = require("../../models/goods_sku.model.js");
const {GoodsModel} = require("../../models/goods.model.js");
const {CateModel} = require("../../models/cate.model.js");
const {Op} = require("sequelize");

const schema = {
  type: 'object',
  properties: {
    cateId: {type: 'number', errorMessage: {type: '必须是数字'}},
    tagId:{type:'number',errorMessage:{type:"必须是数字"},default:null},
    pageSize: {type: 'number', default: 100, errorMessage: {type: '必须是字符串或者数字',}},
    pageIndex: {type: 'number', default: 1, errorMessage: {type: '是一个数组包裹'}},
    order: {type: 'string', default: 'DESC'},
    keyword: {type: 'string'},
    // 字段排序
    inventory: {type: 'boolean', default: 'false'},
    onlyDiscount: {type: 'boolean', default: 'false'},
    sortField: {type: 'string', enum: ["newGoods",'created_at', "sales", "price", "browse"], default: 'created_at'}, //默认最高人气
    sortMethod: {type: 'string', enum: ['DESC', 'ASC'], default: "DESC"}
  },
  // required:['cateId']
}

// 首页菜单栏获取
async function shopHeadGetController(ctx, next) {
 const cateList  = await CateModel.findAll(
    {
      where: {superId: 0},
      include: {
        model: CateModel, as: 'children',
        // include: {
        //   model: GoodsModel, as: 'goods',
        //   include: [
        //     {
        //     model: GoodsSkuModel,
        //     as: 'skus',
        //       // required:true
        //     }, {
        //     model: CateModel,
        //     as: 'cate',
        //   }, {
        //     model: GoodsTagModel,
        //     as: 'tags'
        //   }, {
        //     model: BrandModel,
        //   }
        //   ],
        //   order: [['newGoods'], 'DESC'],
        // },
        // limit:2, //取5条，按热度来
        // required:true
      }
    }
  )
  // let cateIds = []
  // // 获取 标签下所有的
  for (let cate of cateList){
    const cateIds = cate.children.map(item=>item.id)
    let goods = []
    if(cateIds.length>0){
      goods = await GoodsModel.findAll({
        where:{
          cateId:{
            [Op.in]:cateIds
          }
        },
        include: [{
          model: GoodsSkuModel,
          as: 'skus',
          order: [['price'], 'DESC'],
        },
          {
            model:GoodsTagModel,
            as:'tags',
          },
          {
            model:CateModel,
            as:'cate',
          }
        ],
        // limit: 9,
        // order: [['newGoods'], 'DESC'],
        // distinct:true // 不计算子查询待数据，
      })
    }
    cate.setDataValue('goods',goods.splice(0,9))
  }




  ctx.body = backMsg200({data:cateList})
}

//商品分页查询， 多种类查询
async function shopGoodsPageGetController(ctx, next) {
  const data = ctx.query
  ajvValid(data, schema)
  const {cateId, pageSize, pageIndex} = data
  let where = {}
  if (data.keyword) {
    where[Op.or] = [
      //商品名，商品介绍，商品标签词
      {desc: {[Op.like]: `%${data.keyword}%`}},
      {name: {[Op.like]: `%${data.keyword}%`}}
    ]
  }
 const order = [[data.sortField,data.sortMethod]]

  const f = await productListService(data, where,order)
  // await GoodsModel.findAndCountAll({
  //   where,
  //       include:{
  //         model:GoodsSkuModel,
  //         as: 'skus',
  //         order: [['price'],'DESC']
  //     },
  //   limit: pageSize,
  //   offset:  (pageIndex - 1) * pageSize,
  //   order:[['created_at','DESC']],
  //   // subQuery:false // 不在子查询中分页
  //
  //   // where:{id:1},
  //   // include:[{
  //   //   model:CateModel,as:'children',
  //   //   include:{
  //   //     model:GoodsModel,
  //   //     order:[['created_at','DESC']],
  //   //     limit:  pageSize,
  //   //     offset: (pageIndex - 1) * pageSize,
  //   //     include:{
  //   //       model:GoodsSkuModel,
  //   //       as: 'skus',
  //   //       order: [['price'],'DESC']
  //   //     }
  //   //   }
  //   // },{
  //   //   model:GoodsModel,
  //   //   order:[['created_at','DESC']],}]
  // })
  // console.log(f)
  ctx.body = backMsg200({data: f})
}


async function shopSlideshowGetController(ctx, next) {
}


// 商品详情查询
async function shopGoodsDetailsController(ctx, next) {
  const {goodsId} = ctx.query
  if (!isNumber(goodsId)) return backMsg400({msg: '必须是数字类型'})
  const data = await GoodsModel.findOne({
    where: {id: Number(goodsId)},
    include: [{
      model: GoodsSkuModel,
      as: 'skus'
    }, {
      model: CateModel,
      as: 'cate',

    }, {
      model: GoodsTagModel,
      as: 'tags'
    }, {
      model: BrandModel,
    }
    ],
  })
  if (data) {
    let specs = []
    // 处理属性
    if (data.skus.length > 0) {
      for (let item of data.skus) {
        item.specs.forEach(s => {
          const sp = specs.find(h => h.key === s.key)
          // 多组合，添加照片，当个商品，就不需要照片了，
          if (sp) {
            if (!sp.value.find(h => h.value === s.value)) {
              sp.value.push({value: s.value, picture: item.picture})
            }
          } else {
            specs.push({key: s.key, value: [{value: s.value, picture: item.picture}]})
          }
        })
      }
    }
    data.setDataValue('specs', specs)
  }

  // console.log(data)
  ctx.body = backMsg200({data})
}

async function putGoodsController(ctx,next){
  const data = ctx.request.body || ctx.request.params  || {}
  const {goodsId} = data
  const goods =  await GoodsModel.findOne({where:{id:goodsId}})
  if(goods){
    const browse = goods.browse +1
    await GoodsModel.update({browse},{where:{id:goodsId}})
  }
  ctx.body = backMsg200({})
}


// 获取商品 评论信息, 商品id
async function getGoodsCommitController(ctx, next) {


}


//获取首页商品列表，数据,
async function shopTagGetController(ctx, next) {
  // 获取
  const data = await GoodsTagModel.findAll({
    where: {
      isHome: true
    },
    include: [
      {
        model: CateModel,
        as: 'cates',
        include: {model: CateModel, as: 'children'}
      },
      {
        model: GoodsModel,
        as: 'goods',
        include: [
          {
            model: GoodsSkuModel,
            as: 'skus'
          }, {
            model: CateModel,
            as: 'cate',

          }, {
            model: GoodsTagModel,
            as: 'tags'
          }, {
            model: BrandModel,
          }
        ],
      }
    ]
  })

  // console.log(data)
  ctx.body = backMsg200({data})
}

// 获取 热销商品， tag下待随机商品
async function shopTagsGoodsController(ctx,next){
  const tagId = ctx.query.tagId
  if(!tagId) return ctx.body = backMsg400({msg:'缺少参数tagid'})
  const data = await GoodsTagModel.findOne({where:{
     id:Number(tagId)
    },
    include:{
      // through: {
      //   where: 'tags_goods'
      // },
      model: GoodsModel,
      as: 'goods',
      include: [
        {
          model: GoodsSkuModel,
          as: 'skus'
        }, {
          model: CateModel,
          as: 'cate',
        },
      ],
      order:[['browse'],'DESC']
      // limit:5
    }
  })
  ctx.body = backMsg200({data})
}


module.exports = {
  shopTagGetController,
  shopHeadGetController,
  shopSlideshowGetController,
  shopGoodsPageGetController,
  shopGoodsDetailsController,
  shopTagsGoodsController,
  putGoodsController
}
