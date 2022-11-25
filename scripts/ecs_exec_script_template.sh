#!/bin/bash
# In this case i use script for ECS-exec on Serever based on AWS cloud
PS3="Choose area: "
area=("TradeABoatStaging" "TradeRvsStaging" "TradeRvsProductionApi" "TradeaBoatProductionApi")
select i in "${area[@]}"; do
        case $i in
                "TradeABoatStaging")
                        PS3="Choose server:"
                        server=("boat-stage-api" "boat-stage-admin")
                        select p in "${server[@]}"; do
                        case $p in
                                "boat-stage-api")
                                        TASK_ARN=`aws ecs list-tasks --cluster tradeaboatStaging --service boat-stage-api --region ap-southeast-2 --output text --query 'taskArns[0]'`
                                        aws ecs execute-command --region ap-southeast-2 --cluster tradeaboatStaging --task $TASK_ARN --container staging-api --command "/bin/sh" --interactive
                                        break
                                ;;
                                "boat-stage-admin")
                                        TASK_ARN=`aws ecs list-tasks --cluster tradeaboatStaging --service boat-stage-admin --region ap-southeast-2 --output text --query 'taskArns[0]'`
                                        aws ecs execute-command --region ap-southeast-2 --cluster tradeaboatStaging --task $TASK_ARN --container staging-admin --command "/bin/sh" --interactive
                                        break
				;;
                        esac
                        done ;;
                "TradeRvsStaging")
                        PS3="Choose server: "
                        server=("rvs-stage-api" "rvs-stage-admin")
                        select i in "${server[@]}"; do
                        case $i in 
                                "rvs-stage-api")
					TASK_ARN=`aws ecs list-tasks --cluster tradervsStagingApi --service stage-api-rvs --region ap-southeast-2 --output text --query 'taskArns[0]'`
					aws ecs execute-command --region ap-southeast-2 --cluster tradervsStagingApi --task $TASK_ARN --container staging-api --command "/bin/sh" --interactive
				        break
				;;
				"rvs-stage-admin")
					TASK_ARN=`aws ecs list-tasks --cluster tradervsStagingApi --service rvs-stage-admin --region ap-southeast-2 --output text --query 'taskArns[0]'`
					aws ecs execute-command --region ap-southeast-2 --cluster tradervsStagingApi --task $TASK_ARN --container staging-admin --command "/bin/sh" --interactive
				        break
				;;
			esac
			done ;;
		"TradeRvsProductionApi")
	                   TASK_ARN=`aws ecs list-tasks --cluster tradervsProductionApi --service tradervsProductionApi --region ap-southeast-2 --output text --query 'taskArns[0]'` 
                           aws ecs execute-command --region ap-southeast-2 --cluster tradervsProductionApi --task $TASK_ARN --container production-api --command "/bin/sh" --interactive
                           break
		;;
		"TradeaBoatProductionApi")
                           TASK_ARN=`aws ecs list-tasks --cluster tradeaboatProductionApi --service tradeaboatProductionApi --region ap-southeast-2 --output text --query 'taskArns[0]'` 
                           aws ecs execute-command --region ap-southeast-2 --cluster tradeaboatProductionApi --task $TASK_ARN --container production-api --command "/bin/sh" --interactive
                           break
        esac
done
